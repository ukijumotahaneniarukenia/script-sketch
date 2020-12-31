import { NextApiRequest, NextApiResponse } from "next";
import { userData } from "../../../../data/users";

const getUserList = (request: NextApiRequest, response: NextApiResponse) => {
  try {
    if (!Array.isArray(userData)) {
      throw new Error("Cannot find user data");
    }

    response.status(200).json(userData);
  } catch (error) {
    response.status(500).json({ statusCode: 500, message: error.message });
  }
};

export default getUserList;
