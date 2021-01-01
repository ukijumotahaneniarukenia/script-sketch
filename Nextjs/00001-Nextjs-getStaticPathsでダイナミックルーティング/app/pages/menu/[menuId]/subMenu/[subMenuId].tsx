import { GetStaticProps, GetStaticPaths } from "next";
import { SubMenu } from "../../../../interfaces/SubMenu";
import { subMenuDataList } from "../../../../data/subMenu";

type Props = {
  item: SubMenu;
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
      <p>MenuId: {item.menuId}</p>
      <p>SubMenuId: {item.subMenuId}</p>
    </div>
  );
};

export default UserDetailPage;

export const getStaticPaths: GetStaticPaths = async () => {
  const paths = subMenuDataList.map((item) => ({
    params: { menuId: item.menuId.toString(), subMenuId: item.subMenuId.toString() },
  }));
  return { paths, fallback: false };
};

export const getStaticProps: GetStaticProps = async ({ params }) => {
  try {
    const menuId = params?.menuId;
    const subMenuId = params?.subMenuId;
    const resultItem = subMenuDataList.find(
      (item) => item.menuId === menuId && item.subMenuId === subMenuId
    );
    return { props: { item: resultItem } };
  } catch (err) {
    return { props: { errors: err.message } };
  }
};
