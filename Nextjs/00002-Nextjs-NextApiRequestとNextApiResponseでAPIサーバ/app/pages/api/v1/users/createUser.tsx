import { NextApiRequest, NextApiResponse } from "next";
import { userDataList } from "../../../../data/users";
import setUserDataList from "../../../../data/users";

const createUser = (request: NextApiRequest, response: NextApiResponse) => {
  const newUserData = request.body;

  const userId = request.query.id;

  if (userId === null || userId === undefined) {
    return response
      .status(405)
      .json({ statusCode: 405, message: "Invalid Query Parameter" });
  }

  let newUserDataList = userDataList;
  newUserDataList.push(newUserData);

  setUserDataList(newUserDataList);

  return response
    .status(200)
    .json({ statusCode: 200, message: "Success Create" });
};

export default createUser;
