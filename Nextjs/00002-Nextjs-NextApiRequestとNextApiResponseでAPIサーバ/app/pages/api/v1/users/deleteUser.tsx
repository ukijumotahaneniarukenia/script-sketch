import { NextApiRequest, NextApiResponse } from "next";
import { userDataList } from "../../../../data/users";
import setUserDataList from "../../../../data/users";

const deleteUser = (request: NextApiRequest, response: NextApiResponse) => {
  const userId = request.query.id;

  if (userId === null || userId === undefined) {
    return response
      .status(405)
      .json({ statusCode: 405, message: "Invalid Query Parameter" });
  }

  const newUserDataList = userDataList.filter((item) => {
    return item.id !== userId;
  });

  setUserDataList(newUserDataList);

  return response.status(204).json({ statusCode: 204, message: "Success Delete" });

};

export default deleteUser;
