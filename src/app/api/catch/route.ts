import { NextRequest, NextResponse } from "next/server";

export async function POST(request: NextRequest) {
  try {
    // 요청 본문을 추출합니다.
    const body = await request.json();
    const id = body.id;

    // 포켓몬을 잡는 시도를 처리합니다.
    const catchSuccess = Math.random() < 0.3;
    const time = new Date().toLocaleString();

    let response;

    if (catchSuccess) {
      const message = `[info][${time}] 유저가 포켓몬을 잡았습니다! (ID: ${id})`;
      console.log(message);
      response = NextResponse.json({
        success: true,
        message,
      });
    } else {
      const message = `[info][${time}] 유저가 포켓몬을 잡지 못했습니다. (ID: ${id})`;
      console.log(message);
      response = NextResponse.json({
        success: false,
        message,
      });
    }

    return response;
  } catch (error) {
    console.error("Error processing POST request:", error);
    return NextResponse.json(
      { success: false, error: "An unexpected error occurred." },
      { status: 500 }
    );
  }
}
