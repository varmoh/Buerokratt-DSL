SELECT * FROM llm_trainings WHERE id=(SELECT max(id) FROM llm_trainings);