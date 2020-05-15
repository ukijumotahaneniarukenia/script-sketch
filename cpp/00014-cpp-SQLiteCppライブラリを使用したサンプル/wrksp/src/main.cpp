#include <iostream>
#include <SQLiteCpp/SQLiteCpp.h>

#include <sqlite3/sqlite3.h>


int main ()
{
    std::cout << "SQlite3 version " << SQLite::VERSION << " (" << SQLite::getLibVersion() << ")" << std::endl;
    std::cout << "SQliteC++ version " << SQLITECPP_VERSION << std::endl;

    try
    {
        // Open a database file in create/write mode
        SQLite::Database    db("test.db", SQLite::OPEN_READWRITE|SQLite::OPEN_CREATE);
        std::cout << "SQLite database file '" << db.getFilename().c_str() << "' opened successfully\n";

        db.exec("DROP TABLE IF EXISTS test_tbl");
        db.exec("CREATE TABLE test_tbl (id INTEGER PRIMARY KEY, value TEXT)");

        // first row
        int nb = db.exec("INSERT INTO test_tbl VALUES (1, \"test\")");
        std::cout << "INSERT INTO test_tbl VALUES (1, \"test\")\", returned " << nb << std::endl;

        // second row
        nb = db.exec("INSERT INTO test_tbl VALUES (2, \"second\")");
        std::cout << "INSERT INTO test_tbl VALUES (2, \"second\")\", returned " << nb << std::endl;

        // update the second row
        nb = db.exec("UPDATE test_tbl SET value=\"second-updated\" WHERE id='2'");
        std::cout << "UPDATE test_tbl SET value=\"second-updated\" WHERE id='2', returned " << nb << std::endl;

        // Check the results : expect two row of result
        SQLite::Statement   query(db, "SELECT * FROM test_tbl");
        std::cout << "SELECT * FROM test_tbl :\n";
        while (query.executeStep())
        {
            std::cout << "row (" << query.getColumn(0) << ", \"" << query.getColumn(1) << "\")\n";
        }

        db.exec("DROP TABLE test_tbl");
    }
    catch (std::exception& e)
    {
        std::cout << "SQLite exception: " << e.what() << std::endl;
        return EXIT_FAILURE; // unexpected error : exit the example program
    }
    remove("test.db");

    std::cout << "everything ok, quitting\n";

    return EXIT_SUCCESS;
}
