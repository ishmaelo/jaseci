import from byllm.lib { Model }
glob llm = Model(model_name="gpt-4o",api_key="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");

enum Personality {
    INTROVERT,
    EXTROVERT,
    AMBIVERT
}

def get_personality(name: str) -> Personality by llm();

with entry {
    name = "Albert Einstein";
    result = get_personality(name);
    print(f"{result} detected for {name}");
}