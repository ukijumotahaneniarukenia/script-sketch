import { GetStaticProps, GetStaticPaths } from "next";
import { SubMenu } from "../../interfaces/SubMenu";
import { subMenuDataList } from "../../data/subMenu";
import Link from "next/link";

type Props = {
  items: SubMenu[];
  errors?: string;
};

const UserDetailPage = ({ items, errors }: Props) => {
  if (errors) {
    return (
      <p>
        <span style={{ color: "red" }}>Error:</span> {errors}
      </p>
    );
  }
  return (
    <ul>
    {items.map((item) => (
      <li key={item.menuId + item.subMenuId}>
        <Link href="/menu/[menuId]/subMenu/[subMenuId]" as={`/menu/${item.menuId}/subMenu/${item.subMenuId}`}>
          <a>
            {item.menuId}: {item.name}: {item.subMenuId}
          </a>
        </Link>
      </li>
    ))}
  </ul>
    );
};

export default UserDetailPage;

export const getStaticPaths: GetStaticPaths = async () => {
  const paths = subMenuDataList.map((item) => ({
    params: { menuId: item.menuId.toString() },
  }))
  return { paths, fallback: false }
}

export const getStaticProps: GetStaticProps = async ({ params }) => {
  try {
    const menuId = params?.menuId;
    const resultList = subMenuDataList.filter((data) => data.menuId === menuId);
    return { props: { items: resultList } };
  } catch (err) {
    return { props: { errors: err.message } };
  }
};
