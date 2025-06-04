"use client";
import React, { useEffect, useState } from "react";
import BookForm from "../components/BookForm/BookForm";
import BookTable from "../components/BookTable/BookTable";

type Book = {
  id: number;
  title: string;
  category: string;
  publisher: string;
  image: string;
  quantity: number;
};

const categories = ["มังงะ", "นิยาย"];
const publishers = [
  "LuckPim",
  "SiamInterCommic",
  "Phonix Next",
  "FirstPage",
  "Zenshu",
  "Dex",
];

const BookManager: React.FC = () => {
  const [books, setBooks] = useState<Book[]>([]);
  const [filterCategory, setFilterCategory] = useState<string | null>(null);
  const [filterPublisher, setFilterPublisher] = useState<string | null>(null);

  const [newBook, setNewBook] = useState({
    title: "",
    category: categories[0],
    publisher: publishers[0],
    image: "",
    quantity: 1,
  });

  useEffect(() => {
    const fetchBooks = async () => {
      try {
        const res = await fetch("/api/books");
        const data = await res.json();
        setBooks(data);
      } catch (error) {
        console.error("Failed to fetch books:", error);
      }
    };

    fetchBooks();
  }, []);

  const handleChangeNewBook = (field: string, value: string) => {
    setNewBook((prev) => ({ ...prev, [field]: value }));
  };

  const handleUpdateBookField = async (
    id: number,
    field: keyof Book,
    value: string
  ) => {
    const updatedBook = books.find((b) => b.id === id);
    if (!updatedBook) return;

    const newBookData = { ...updatedBook, [field]: value };

    try {
      const res = await fetch("/api/books", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(newBookData),
      });

      if (!res.ok) throw new Error("Failed to update book");

      const result = await res.json();
      setBooks((prev) => prev.map((book) => (book.id === id ? result : book)));
    } catch (err) {
      console.error(err);
    }
  };

  const handleAddBook = async () => {
    if (newBook.title.trim() === "") return;

    try {
      const res = await fetch("/api/books", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(newBook),
      });
      if (!res.ok) throw new Error("Failed to add book");
      const createdBook = await res.json();
      setBooks([...books, createdBook]);
      setNewBook({
        title: "",
        category: categories[0],
        publisher: publishers[0],
        image: "",
        quantity: 1,
      });
    } catch (error) {
      console.error(error);
    }
  };

  const handleChangeCategory = (id: number, newCategory: string) => {
    handleUpdateBookField(id, "category", newCategory);
  };

  const handleChangePublisher = (id: number, newPublisher: string) => {
    handleUpdateBookField(id, "publisher", newPublisher);
  };

  const handleDeleteBook = async (id: number) => {
    try {
      const res = await fetch("/api/books", {
        method: "DELETE",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id }),
      });

      if (!res.ok) throw new Error("Failed to delete book");

      setBooks((prev) => prev.filter((book) => book.id !== id));
    } catch (err) {
      console.error(err);
    }
  };

  const filteredBooks = books.filter((book) => {
    if (filterCategory && book.category !== filterCategory) return false;
    if (filterPublisher && book.publisher !== filterPublisher) return false;
    return true;
  });

  return (
    <div className="p-6 font-sans bg-gray-50 min-h-screen">
      {/* กรองประเภท */}
      <div className="mb-6">
        <span className="font-semibold text-lg mr-2">📂 กรองประเภท:</span>
        <div className="flex flex-wrap mt-2">
          {categories.map((c) => (
            <button
              key={c}
              onClick={() => setFilterCategory(filterCategory === c ? null : c)}
              className={`px-4 py-1 mr-2 mb-2 rounded-full shadow-sm transition font-medium ${
                filterCategory === c
                  ? "bg-blue-600 text-white"
                  : "bg-gray-200 text-gray-800 hover:bg-blue-400 hover:text-white"
              }`}
            >
              {c}
            </button>
          ))}
          {filterCategory && (
            <button
              onClick={() => setFilterCategory(null)}
              className="px-4 py-1 bg-red-400 text-white rounded-full shadow hover:bg-red-500 ml-2 font-medium"
            >
              ❌ ล้างตัวกรอง
            </button>
          )}
        </div>
      </div>

      {/* กรองสำนักพิมพ์ */}
      <div className="mb-6">
        <span className="font-semibold text-lg mr-2">🏢 กรองสำนักพิมพ์:</span>
        <div className="flex flex-wrap mt-2">
          {publishers.map((p) => {
            let baseBg = "bg-gray-200 text-gray-800";
            let activeBg = "bg-gray-400 text-white";
            let hoverBg = "hover:bg-gray-300";

            switch (p) {
              case "LuckPim":
                baseBg = "bg-green-400 text-white";
                activeBg = "bg-green-700 text-white";
                hoverBg = "hover:bg-green-600";
                break;
              case "SiamInterCommic":
                baseBg = "bg-red-400 text-white";
                activeBg = "bg-red-700 text-white";
                hoverBg = "hover:bg-red-600";
                break;
              case "Phonix Next":
                baseBg = "bg-blue-100 text-blue-800";
                activeBg = "bg-blue-500 text-white";
                hoverBg = "hover:bg-blue-400";
                break;
              case "FirstPage":
                baseBg = "bg-blue-400 text-white";
                activeBg = "bg-blue-700 text-white";
                hoverBg = "hover:bg-blue-600";
                break;
              case "Zenshu":
                baseBg = "bg-red-800 text-white";
                activeBg = "bg-red-900 text-white";
                hoverBg = "hover:bg-red-700";
                break;
              case "Dex":
                baseBg = "bg-orange-500 text-white";
                activeBg = "bg-orange-700 text-white";
                hoverBg = "hover:bg-orange-600";
                break;
            }

            return (
              <button
                key={p}
                onClick={() =>
                  setFilterPublisher(filterPublisher === p ? null : p)
                }
                className={`px-4 py-1 mr-2 mb-2 rounded-full shadow-sm font-medium transition ${
                  filterPublisher === p ? activeBg : baseBg
                } ${hoverBg}`}
              >
                {p}
              </button>
            );
          })}
          {filterPublisher && (
            <button
              onClick={() => setFilterPublisher(null)}
              className="px-4 py-1 bg-gray-600 text-white rounded-full shadow hover:bg-gray-800 ml-2 font-medium"
            >
              ❌ ล้างตัวกรอง
            </button>
          )}
        </div>
      </div>

      {/* ปุ่มแสดงทั้งหมด */}
      <div className="mb-6">
        <button
          onClick={() => {
            setFilterCategory(null);
            setFilterPublisher(null);
          }}
          className="px-6 py-2 bg-indigo-600 text-white rounded shadow hover:bg-indigo-700 transition font-medium"
        >
          🔄 แสดงทั้งหมด
        </button>
      </div>

      {/* หัวข้อ */}
      <h2 className="text-3xl font-extrabold mb-6 text-indigo-800 border-b pb-2">
        📚 ระบบจัดการหนังสือ
      </h2>

      {/* ฟอร์มเพิ่มหนังสือ */}
      <BookForm
        newBook={newBook}
        categories={categories}
        publishers={publishers}
        onChange={handleChangeNewBook}
        onAdd={handleAddBook}
      />

      {/* ยอดรวม */}
      <p className="text-xl font-semibold text-green-700 bg-green-100 rounded px-4 py-2 inline-block mb-6 shadow">
        ✅ ยอดรวมหนังสือทั้งหมด:{" "}
        <span className="font-bold">{filteredBooks.length}</span> เล่ม
      </p>

      {/* ตารางหนังสือ */}
      <BookTable
        books={filteredBooks}
        categories={categories}
        publishers={publishers}
        onCategoryChange={handleChangeCategory}
        onPublisherChange={handleChangePublisher}
        onDelete={handleDeleteBook}
        onUpdateBookField={handleUpdateBookField}
      />
    </div>
  );
};

export default BookManager;
