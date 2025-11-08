obj Tweet {
    has content: str, author: str, timestamp: str, likes: int = 0;

    def like() -> None;
    def unlike() -> None;
    def get_preview(max_length: int) -> str;
    def get_like_count() -> int;
}