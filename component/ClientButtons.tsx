"use client";
import { useState } from "react";

interface ClientButtonProps {
  handleCatchPokemon: () => Promise<any>;
}

export default function ClientButton({
  handleCatchPokemon,
}: ClientButtonProps) {
  const [catched, setCatched] = useState(false);

  const onCatchClick = async () => {
    const result = await handleCatchPokemon();
    // alert(result.message);
    if (result.success) {
      setCatched(true);
    }
  };

  return (
    <>
      {catched ? (
        <div>포켓몬을 잡았습니다!</div>
      ) : (
        <button onClick={onCatchClick}>포켓몬 잡기</button>
      )}
    </>
  );
}
