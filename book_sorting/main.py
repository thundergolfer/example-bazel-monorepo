import click


@click.command()
@click.option("--count", default=1, help="Number of greetings.")
def cli(count):
    """
    Stub program. TODO(Jonathon): Implement a more interesting program
    Example usage: bazel run //book_sorting:main -- --count 45
    """
    print("Hello world " * count)


if __name__ == "__main__":
    cli()
