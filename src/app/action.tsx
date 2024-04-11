import { NextResponse } from "next/server";

export const POKEAPI_URL = "https://pokeapi.co/api/v2/pokemon/";

export interface Pokemon {
  id: number;
  name: string;
  height: number;
  weight: number;
  sprites: {
    front_default: string;
  };
  types: {
    type: {
      name: string;
    };
  }[];
}

export async function getPokemon(
  id: string
): Promise<NextResponse<{ pokemon: Pokemon } | { error: string }>> {
  try {
    const response = await fetch(POKEAPI_URL + id);
    const data: Pokemon = await response.json();
    const pokemon: Pokemon = {
      id: data.id,
      name: data.name,
      height: data.height,
      weight: data.weight,
      sprites: {
        front_default: data.sprites.front_default,
      },
      types: data.types.map((type) => ({
        type: {
          name: type.type.name,
        },
      })),
    };

    return NextResponse.json({ pokemon });
  } catch (error) {
    console.error("Error fetching pokemons:", error);
    return NextResponse.json(
      { error: "Failed to fetch pokemons" },
      { status: 500 }
    );
  }
}
