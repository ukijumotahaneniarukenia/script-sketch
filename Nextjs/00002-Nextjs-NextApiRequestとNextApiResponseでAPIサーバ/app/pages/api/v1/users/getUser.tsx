import { NextApiRequest, NextApiResponse } from "next";
import { userData } from "../../../../data/users";

const getUser = (request: NextApiRequest, response: NextApiResponse) => {
  const userId = request.query.id;

  if (userId === null || userId === undefined) {
    return response
      .status(405)
      .json({ statusCode: 405, message: "Invalid Query Parameter" });
  }
  const user = userData.filter((item) => {
    return item.id === userId;
  });

  if (user.length === 0) {
    return response
      .status(404)
      .json({ statusCode: 404, message: "Not Found User" });
  }

  return response.status(200).json(user);
};

export default getUser;
