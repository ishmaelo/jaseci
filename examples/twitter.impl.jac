impl Tweet.like() -> None {
    self.likes += 1;
}

impl Tweet.unlike() -> None {
    if self.likes > 0 {
        self.likes -= 1;
    }
}

impl Tweet.get_preview(max_length: int) -> str {
    return self.content[:max_length] + "..." if len(self.content) > max_length else self.content;
}

impl Tweet.get_like_count() -> int {
    return self.likes;
}