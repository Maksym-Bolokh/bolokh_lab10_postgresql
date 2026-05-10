from db_connection import get_connection
from utils import print_table


def show_all_tables(cursor):

    tables_query = """
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'public'
    ORDER BY table_name;
    """

    cursor.execute(tables_query)

    tables = cursor.fetchall()

    for table in tables:

        table_name = table[0]

        print("\n" + "#" * 100)
        print(f"TABLE: {table_name}")
        print("#" * 100)

        structure_query = f"""
        SELECT
            column_name,
            data_type
        FROM information_schema.columns
        WHERE table_name = '{table_name}';
        """

        cursor.execute(structure_query)

        structure = cursor.fetchall()

        print_table(
            f"STRUCTURE OF {table_name}",
            ["COLUMN", "TYPE"],
            structure
        )

        cursor.execute(f"SELECT * FROM {table_name}")

        rows = cursor.fetchall()

        columns = [desc[0] for desc in cursor.description]

        print_table(
            f"DATA FROM {table_name}",
            columns,
            rows
        )


def execute_queries(cursor):

    queries = {

        "1. Books after 2001": """
            SELECT title, publication_year
            FROM books
            WHERE publication_year > 2001
            ORDER BY title;
        """,

        "2. Count books by type": """
            SELECT book_type, COUNT(*) AS total_books
            FROM books
            GROUP BY book_type;
        """,

        "3. Readers who borrowed tutorials": """
            SELECT DISTINCT r.last_name, r.first_name
            FROM readers r
            JOIN book_issues bi
            ON r.reader_ticket = bi.reader_ticket
            JOIN books b
            ON bi.inventory_number = b.inventory_number
            WHERE b.book_type = 'посібник'
            ORDER BY r.last_name;
        """,

        "4. Technical books": """
            SELECT *
            FROM books
            WHERE section = 'технічна';
        """,

        "5. Return deadlines": """
            SELECT
                b.title,
                bi.issue_date,
                bi.issue_date + (b.max_borrow_days || ' days')::INTERVAL
                AS return_deadline
            FROM book_issues bi
            JOIN books b
            ON bi.inventory_number = b.inventory_number;
        """,

        "6. Cross query": """
            SELECT
                section,

                COUNT(CASE WHEN book_type = 'посібник' THEN 1 END)
                AS tutorials,

                COUNT(CASE WHEN book_type = 'книга' THEN 1 END)
                AS books,

                COUNT(CASE WHEN book_type = 'періодичне видання' THEN 1 END)
                AS magazines

            FROM books
            GROUP BY section;
        """
    }

    for title, query in queries.items():

        cursor.execute(query)

        rows = cursor.fetchall()

        columns = [desc[0] for desc in cursor.description]

        print_table(title, columns, rows)


def main():

    connection = get_connection()

    cursor = connection.cursor()

    print("\nDATABASE CONNECTED SUCCESSFULLY\n")

    show_all_tables(cursor)

    execute_queries(cursor)

    cursor.close()

    connection.close()

    print("\nDATABASE CONNECTION CLOSED\n")


if __name__ == "__main__":
    main()