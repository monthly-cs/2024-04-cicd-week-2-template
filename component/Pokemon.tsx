"use client";
import type { Pokemon } from "$/app/action";
import Image from "next/image";
import styles from "./Pokemon.module.css";
import ClientButton from "./ClientButtons";
import { Suspense } from "react";

export default function Pokemon({ pokemon }: { pokemon: Pokemon }) {
  const handleCatchPokemon = async () => {
    try {
      const response = await fetch("/api/catch", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ id: pokemon.id }),
      });

      const result = await response.json();
      return result;
    } catch (error) {
      console.error("Error handling catch Pokemon:", error);
      alert("포켓몬을 잡는 도중 오류가 발생했습니다.");
      return false;
    }
  };

  return (
    <>
      <h1>{pokemon.name}</h1>
      <div className={styles.pokemonBox}>
        <Image
          src={pokemon.sprites.front_default}
          alt={pokemon.name}
          width={200}
          height={200}
          className={styles.pokemon}
        />
      </div>

      {/* Suspense를 사용하여 로딩 중 또는 클라이언트 컴포넌트를 분리 */}
      <Suspense fallback={<div>Loading...</div>}>
        {/* 포켓몬 잡기 버튼을 처리하는 클라이언트 컴포넌트 */}
        <ClientButton handleCatchPokemon={handleCatchPokemon} />
      </Suspense>
    </>
  );
}
