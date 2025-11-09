# Implement traversal logic
impl Document.explore_topics {
    visit [-->(`?Topic)];
}

impl Topic.collect_sentences {
    visit [-->(`?Sentence)];
    

}

impl Sentence.collect_words {

    key_sentences = [self -->(`?Sentence)];

    
    print(f"Summary: {visitor.summary}");
    
}

impl summarizer.build_summary {
    visit [-->(`?Document)];
}