import { NextApiRequest, NextApiResponse } from "next";
import getUser from "../../../api/v1/users/getUser";
import deleteUser from "../../../api/v1/users/deleteUser";

const HttpMethodHandler = (
  request: NextApiRequest,
  response: NextApiResponse
) => {
  response.setHeader("Content-Type", "application/json");

  const httpMethod = request.method;
  switch (httpMethod) {
    case "GET":
      getUser(request, response);
      break;
    case "DELETE":
      deleteUser(request, response);
      break;
    default:
      break;
  }
};

export default HttpMethodHandler;
