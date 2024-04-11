import Link from "next/link";
import styles from "./page.module.css";

export default function Home() {
  return (
    <main className={styles.main}>
      <div className={styles.description}>
        <p>2024-04-cicd-week-2-template</p>

        <ul>
          <Link prefetch href={`poke/1`}>
            <li>1</li>
          </Link>
          <Link prefetch href={`poke/2`}>
            <li>2</li>
          </Link>
          <Link prefetch href={`poke/3`}>
            <li>3</li>
          </Link>
          <Link prefetch href={`poke/4`}>
            <li>4</li>
          </Link>
          <Link prefetch href={`poke/5`}>
            <li>5</li>
          </Link>
        </ul>
      </div>
    </main>
  );
}
