import { GetStaticProps } from "next";
import { User } from "../interfaces/User";
import { userData } from "../data/users";
import Link from "next/link";

type Props = {
  items: User[];
};

const unko = ({ items }: Props) => (
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
export default unko;

export const getStaticProps: GetStaticProps = async () => {
  const items: User[] = userData;
  return { props: { items } };
};
