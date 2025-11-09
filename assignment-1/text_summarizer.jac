# Define node types for Document, Topic, Sentence, and Word
node Document {
    has title: str;
    can explore_topics with summarizer entry;
}

node Topic {
    has name: str;
    can collect_sentences with summarizer entry;
}

node Sentence {
    has text: str;
    has relevance: float;
    can collect_words with summarizer entry;
}

node Word {
    has text: str;
}

# Define a summarizer walker that traverses the document and collects summary
walker summarizer {
    has summary: str = "";
    has total_sentences: int = 0;
    has collected_sentences: int = 0;
    can build_summary with Document entry;
}

# Build the graph structure
with entry {
    # Create a document node
    doc = root ++> Document(title="Sample Document");

    # Create topics linked to document
    topic1 = doc ++> Topic(name="Technology");
    topic2 = doc ++> Topic(name="Science");

    # Add sentences to topics
    topic1 ++> Sentence(text="AI is transforming the world.",relevance=0.6);
    topic1 ++> Sentence(text="Quantum computing is the next frontier.",relevance=0.8);
    topic1 ++> Sentence(text="Arsenal has beaten Fulham in the ongoing EPL games.",relevance=0.1);
    topic1 ++> Sentence(text="Kenya's Safaricom has launched 5G networks in major towns.",relevance=0.9);
    topic2 ++> Sentence(text="Climate change impacts are accelerating.",relevance=0.9);
    topic2 ++> Sentence(text="Lake Baringo water level has risen forcing residents to vacate its basin.",relevance=0.8);

    # Launch summarizer walker from the root node
    summarizer("Technology") spawn doc;
    
}

