import { NextApiRequest, NextApiResponse } from "next";
import { userDataList } from "../../../../data/users";
import setUserDataList from "../../../../data/users";

const updateUser = (request: NextApiRequest, response: NextApiResponse) => {
  const userId = request.query.id;
  const userName = request.body.name;

  if (userId === null || userId === undefined) {
    return response
      .status(405)
      .json({ statusCode: 405, message: "Invalid Query Parameter" });
  }

  if (userName === "" || userName === null || userName === undefined) {
    return response
      .status(405)
      .json({ statusCode: 405, message: "Invalid Query Parameter" });
  }

  const newUserDataList = userDataList.map((item) => {
    if (item.id === userId) {
      return { id: item.id, name: userName };
    }
    return item;
  });

  setUserDataList(newUserDataList);

  return response
    .status(200)
    .json({ statusCode: 200, message: "Success Update" });
};

export default updateUser;
