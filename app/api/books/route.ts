import { NextRequest, NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export async function GET(request: NextRequest) {
  const books = await prisma.book.findMany();
  return NextResponse.json(books);
}

export async function POST(request: NextRequest) {
  const body = await request.json();
  const { title, category, publisher, image, quantity } = body;

  if (!title) return NextResponse.json({ error: "Title is required" }, { status: 400 });

  const newBook = await prisma.book.create({
    data: { title, category, publisher, image, quantity: Number(quantity) },
  });
  return NextResponse.json(newBook, { status: 201 });
}

export async function PUT(request: NextRequest) {
  const body = await request.json();
  const { id, title, category, publisher, image, quantity } = body;
  if (!id) return NextResponse.json({ error: "ID is required" }, { status: 400 });

  const updatedBook = await prisma.book.update({
    where: { id: Number(id) },
    data: { title, category, publisher, image, quantity: Number(quantity) },
  });
  return NextResponse.json(updatedBook);
}

export async function DELETE(request: NextRequest) {
  const body = await request.json();
  const { id } = body;
  if (!id) return NextResponse.json({ error: "ID is required" }, { status: 400 });

  await prisma.book.delete({ where: { id: Number(id) } });
  return new Response(null, { status: 204 });
}
