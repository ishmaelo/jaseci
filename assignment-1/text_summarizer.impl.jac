impl turn.check{
    guess = input("Enter a text: ");
    visit [-->];
}


impl Document.start_game{
    end: `root | turn = here;
    for i = 0 to i < 10 by i += 1 {
        end ++> (end := turn());
    }
    visit [-->];
}


impl Document.count_characters(text: str) {
    
}