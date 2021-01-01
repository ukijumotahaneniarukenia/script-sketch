import { GetStaticProps } from "next";
import { User } from "../../interfaces/User";
import { userDataList } from "../../data/users";
import Link from "next/link";

type Props = {
  items: User[];
};

const UserIndexPage = ({ items }: Props) => (
  <ul>
    {items.map((item) => (
      <li key={item.id}>
        <Link href="/users/[id]" as={`/users/${item.id}`}>
          <a>
            {item.id}: {item.name}
          </a>
        </Link>
      </li>
    ))}
  </ul>
);
export default UserIndexPage;

export const getStaticProps: GetStaticProps = async () => {
  const items: User[] = userDataList;
  return { props: { items } };
};
