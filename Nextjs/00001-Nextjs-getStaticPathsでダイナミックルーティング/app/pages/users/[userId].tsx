import { GetStaticProps, GetStaticPaths } from "next";
import { User } from "../../interfaces/User";
import { userDataList } from "../../data/users";

type Props = {
  item: User;
  errors?: string;
};

const UserDetailPage = ({ item, errors }: Props) => {
  if (errors) {
    return (
      <p>
        <span style={{ color: "red" }}>Error:</span> {errors}
      </p>
    );
  }
  return (
    <div>
      <h1>Detail for {item.name}</h1>
      <p>ID: {item.userId}</p>
    </div>
  );
};

export default UserDetailPage;

export const getStaticPaths: GetStaticPaths = async () => {
  // Error: getStaticPaths is required for dynamic SSG pages and is missing for '/users/[userId]'.
  // Read more: https://err.sh/next.js/invalid-getstaticpaths-value
  const paths = userDataList.map((user) => ({
    params: { userId: user.userId.toString() },
  }))
  return { paths, fallback: false }
}

export const getStaticProps: GetStaticProps = async ({ params }) => {
  try {
    const userId = params?.userId;
    const item = userDataList.find((data) => data.userId === userId);
    return { props: { item } };
  } catch (err) {
    return { props: { errors: err.message } };
  }
};
