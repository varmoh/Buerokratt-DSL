import os
import subprocess

ENV_FILE = ".env.img"
STATE_FILE = ".env_state.txt"
GITHUB_REGISTRY = "ghcr.io/buerokratt"

def build_and_publish_image(release, version, build, fix):
    DOCKER_TAG_CUSTOM = f"{GITHUB_REGISTRY}/buerokratt-dsl:{release}-{version}.{build}.{fix}"
    print(f"Building Docker image for {release} with tag: {DOCKER_TAG_CUSTOM}")
    # Run the actual docker build command
    subprocess.run(["docker", "image", "build", "--no-cache", "--tag", DOCKER_TAG_CUSTOM, "-f", f"Dockerfile.{release}", "."])
    # Push the image to GitHub Packages
    subprocess.run(["docker", "image", "push", DOCKER_TAG_CUSTOM])

# Function to read state file
def read_state():
    try:
        with open(STATE_FILE, "r") as file:
            return file.read()
    except FileNotFoundError:
        return ""

# Function to write current state to state file
def write_state(state):
    with open(STATE_FILE, "w") as file:
        file.write(state)

# Get the initial state from the state file
old_state = read_state()
print("Old State:")
print(old_state)

# Get the current content of .env.img
with open(ENV_FILE, "r") as file:
    new_state = file.read()

print("New State:")
print(new_state)

# Check if the content has changed
if old_state != new_state:
    print("Detected changes in .env.img file...")
    
    # Split the content of .env.img into blocks
    blocks = new_state.split("\n\n")
    
    # Loop through each block to check for changes
    for block in blocks:
        lines = block.strip().split("\n")
        release = None
        version = None
        build = None
        fix = None
        for line in lines:
            parts = line.strip().split("=")
            if len(parts) == 2:
                if parts[0] == "RELEASE":
                    release = parts[1]
                elif parts[0] == "VERSION":
                    version = parts[1]
                elif parts[0] == "BUILD":
                    build = parts[1]
                elif parts[0] == "FIX":
                    fix = parts[1]
        
        if release is not None and version is not None and build is not None and fix is not None:
            # Check if this block has changed
            if block not in old_state:
                print(f"Building and publishing Docker image for {release} with version={version}, build={build}, fix={fix}")
                build_and_publish_image(release, version, build, fix)
            else:
                print(f"No changes detected for {release} block.")
    write_state(new_state)  # Update the state file with new content
else:
    print("No changes detected in .env.img file.")
