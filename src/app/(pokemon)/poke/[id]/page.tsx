import { use } from "react";
import { notFound } from "next/navigation";
import { getPokemon } from "$/app/action";
import Pokemon from "../../../../../component/Pokemon";
import styles from "./page.module.css";
import Link from "next/link";

interface Props {
  params: { id: string };
}

export default function PokemonPage({ params }: Props) {
  const responsePromise = getPokemon(params.id);
  const { pokemon, error } = use(responsePromise.then((res) => res.json()));

  if (error) {
    if (error === "Failed to fetch pokemons") {
      notFound();
    }
    return <div>Error: {error}</div>;
  }

  if (!pokemon) {
    return <div>Loading...</div>;
  }

  return (
    <main className={styles.main}>
      <div className={styles.description}>
        <Link href={"/"}>
          <p>Go Back</p>
        </Link>
        <Pokemon pokemon={pokemon} />
      </div>
    </main>
  );
}
