# ---------------------------------------------
# Jac Program: Multi-Document Summarization
# ---------------------------------------------

# Define node types
node Source {
    has name: str;
    can explore_topics with summarizer entry;
}
node Topic {
    has category: str;
    can collect_sentences with summarizer entry;
}

node Sentence {
    has text: str;
    has relevance: float;
}

# Define the summarizer walker
walker summarizer {
    has summary_goal: str;
    has summary: str = "";
    can build_summary with root entry;
}

# Build the graph structure
with entry {
    # Create document sources
    src1 = root ++> Source("The Star");
    src2 = root ++> Source("BBC");

    # Create topics
    topic1 = src1 ++> Topic("Education Reform");
    topic2 = src2 ++> Topic("Teacher Strikes");

    # Add sentences with relevance scores
    topic1 ++> Sentence("The government plans to increase teacher salaries.", 0.9);
    topic1 ++> Sentence("Experts warn of funding shortages for education.", 0.7);
    topic2 ++> Sentence("Teachers marched to parliament demanding pay equity.", 0.95);
    topic2 ++> Sentence("Students were affected by the prolonged strike.", 0.6);

    # Launch the summarizer walker
    summarizer("Education News Summary") spawn root;
}

# Implementation logic for traversal
impl Source.explore_topics {
    visit [-->(`?Topic)];
}

impl Topic.collect_sentences {
    # Select highly relevant sentences
    key_sentences = [self -->(`?Sentence)](relevance >= 0.8);
    for s in key_sentences{
        visitor.summary += s.text + " ";
}
    }
        
impl summarizer.build_summary {
    visit [-->(`?Source)];
    print("=========================");
    print(f"Summary Goal: {summary_goal}");
    print("=========================");
    print(summary);
}
