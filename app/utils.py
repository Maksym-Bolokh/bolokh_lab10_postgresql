from tabulate import tabulate


def print_table(title, columns, rows):
    print("\n" + "=" * 80)
    print(title)
    print("=" * 80)

    print(
        tabulate(
            rows,
            headers=columns,
            tablefmt="grid",
            stralign="center"
        )
    )

    print("\n")