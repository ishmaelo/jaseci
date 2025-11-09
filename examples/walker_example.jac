node Person {
    has name: str;
    has visited: bool = False;  # To keep track of who we've greeted
}

edge FriendsWith {}

# This walker will greet every person it meets
walker GreetFriends {
    can greet with Person entry {
        if not here.visited {
            here.visited = True;
            print(f"Hello, {here.name}!");

            # Now, tell the walker to go to all connected friends
            visit [->:FriendsWith:->];
        }
    }
}

with entry {
    # Create friend network
    alice = root ++> Person(name="Alice");
    bob = root ++> Person(name="Bob");
    charlie = root ++> Person(name="Charlie");
    ishmael = root ++> Person(name="Ishmael");

    # Connect friends
    alice +>:FriendsWith:+> bob +>:FriendsWith:+> charlie;
    alice +>:FriendsWith:+> charlie;  # Alice also friends with Charlie
    bob +>:FriendsWith:+> ishmael;

    # Start the walker on the 'alice' node to greet everyone
    bob[0] spawn GreetFriends();
}
