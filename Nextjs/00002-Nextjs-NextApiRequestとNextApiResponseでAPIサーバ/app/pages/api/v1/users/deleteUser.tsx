import { NextApiRequest, NextApiResponse } from "next";
import { userData } from "../../../../data/users";
import setUserData from "../../../../data/users";

const deleteUser = (request: NextApiRequest, response: NextApiResponse) => {
  const userId = request.query.id;

  if (userId === null || userId === undefined) {
    return response
      .status(405)
      .json({ statusCode: 405, message: "Invalid Query Parameter" });
  }

  const newUserdata = userData.filter((item) => {
    return item.id !== userId;
  });

  setUserData(newUserdata);

  return response.status(201).json({ statusCode: 201, message: "Success Delete" });

};

export default deleteUser;
