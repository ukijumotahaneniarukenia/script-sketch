import { GetStaticProps } from "next";
import { Menu } from "../../interfaces/Menu";
import { menuDataList } from "../../data/menu";
import Link from "next/link";

type Props = {
  items: Menu[];
};

const UserIndexPage = ({ items }: Props) => (
  <ul>
    {items.map((item) => (
      <li key={item.menuId}>
        <Link href="/menu/[menuId]" as={`/menu/${item.menuId}`}>
          <a>
            {item.menuId}: {item.name}
          </a>
        </Link>
      </li>
    ))}
  </ul>
);
export default UserIndexPage;

export const getStaticProps: GetStaticProps = async () => {
  const items: Menu[] = menuDataList;
  return { props: { items } };
};
