import Link from "next/link";

const IndexPage = () => (
  <div>
    <h1>Hello Next.js 👋</h1>
    <p>
      <Link href="/about">
        <a>About</a>
      </Link>
      <div></div>
      <Link href="/users">
        <a>Users</a>
      </Link>
    </p>
  </div>
);

export default IndexPage;
