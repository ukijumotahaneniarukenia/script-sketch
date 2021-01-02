import React, { useState } from "react";
import { makeStyles } from "@material-ui/core/styles";
import Paper from "@material-ui/core/Paper";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TablePagination from "@material-ui/core/TablePagination";
import TableRow from "@material-ui/core/TableRow";
import TextField from "@material-ui/core/TextField";
import Slider from "@material-ui/core/Slider";
import { bookDataList } from "../data/books";

// https://material-ui.com/components/tables/
interface Column {
  id: "bookId" | "author" | "genre" | "title" | "price";
  label: string;
  minWidth?: number;
  align?: "right";
  format?: (value: number) => string;
}

const columns: Column[] = [
  { id: "bookId", label: "BookId", minWidth: 170 },
  { id: "author", label: "Author", minWidth: 170 },
  { id: "genre", label: "Genre", minWidth: 100 },
  { id: "title", label: "Title", minWidth: 100 },
  {
    id: "price",
    label: "Price",
    minWidth: 170,
    align: "right",
  },
];

const rows = bookDataList;

const useStyles = makeStyles({
  root: {
    width: "100%",
  },
  container: {
    maxHeight: 440,
  },
});

function Search() {
  // 関数コンポーネント内のスコープ

  const classes = useStyles();

  // 変数宣言
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [searchAuthor, setSearchAuthor] = useState("");
  const [searchPrice, setSearchPrice] = useState<number[]>([0, 100]);

  // イベントハンドラ定義
  const handleChangePage = (event: unknown, newPage: number) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    setRowsPerPage(+event.target.value);
    setPage(0);
  };

  const handleChangeSearchAuthor = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    console.log(event);
    console.log(event.target.value);
    setSearchAuthor(event.target.value);
  };

  const handleChangeSearchPrice = (event: any, newValue: number | number[]) => {
    console.log(event); // MouseEvent
    setSearchPrice(newValue as number[]);
    console.log(searchPrice)
  };

  function priceText(value: number) {
    return `${value}円`;
  }

  return (
    // イベントハンドラの割付
    <Paper className={classes.root}>
      <p>Genreで検索</p>
      {/* https://material-ui.com/api/text-field/ */}
      <TextField
        id="searchAuthor"
        type="text"
        onChange={handleChangeSearchAuthor}
      />
      <p>値段で検索</p>
      {/* https://material-ui.com/components/slider/#range-slider */}
      <Slider
        value={searchPrice}
        onChange={handleChangeSearchPrice}
        valueLabelDisplay="auto"
        aria-labelledby="range-slider"
        getAriaValueText={priceText}
      />
      <TableContainer className={classes.container}>
        <Table stickyHeader aria-label="sticky table">
          <TableHead>
            <TableRow>
              {columns.map((column) => (
                <TableCell
                  key={column.id}
                  align={column.align}
                  style={{ minWidth: column.minWidth }}
                >
                  {column.label}
                </TableCell>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {rows
              .slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
              .map((row) => {
                console.log(row);
                console.log(row.genre);
                console.log(row.price);
                console.log(searchAuthor);
                if ( (searchPrice[0]<=row.price && row.price<=searchPrice[1]) && searchAuthor !== "" && (searchAuthor === row.genre) ) {
                  console.log('うんこうんこうんこうんこ')
                  return (
                    <TableRow
                      hover
                      role="checkbox"
                      tabIndex={-1}
                      key={row.bookId}
                    >
                      {columns.map((column) => {
                        const value = row[column.id];
                        return (
                          <TableCell key={column.id} align={column.align}>
                            {column.format && typeof value === "number"
                              ? column.format(value)
                              : value}
                          </TableCell>
                        );
                      })}
                    </TableRow>
                  );
                }
                if ( (searchPrice[0]<=row.price && row.price<=searchPrice[1]) && searchAuthor === "") {
                  console.log('うんこうんこうんこ')
                  return (
                    <TableRow
                      hover
                      role="checkbox"
                      tabIndex={-1}
                      key={row.bookId}
                    >
                      {columns.map((column) => {
                        const value = row[column.id];
                        return (
                          <TableCell key={column.id} align={column.align}>
                            {column.format && typeof value === "number"
                              ? column.format(value)
                              : value}
                          </TableCell>
                        );
                      })}
                    </TableRow>
                  );
                }
              })}
          </TableBody>
        </Table>
      </TableContainer>
      <TablePagination
        rowsPerPageOptions={[10, 25, 100]}
        component="div"
        count={rows.length}
        rowsPerPage={rowsPerPage}
        page={page}
        onChangePage={handleChangePage}
        onChangeRowsPerPage={handleChangeRowsPerPage}
      />
    </Paper>
  );
}

export { Search };
