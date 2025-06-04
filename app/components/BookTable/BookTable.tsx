"use client";
import React, { useState } from "react";

type Book = {
  id: number;
  title: string;
  category: string;
  publisher: string;
  image: string;
  quantity: number;
};

type Props = {
  books: Book[];
  categories: string[];
  publishers: string[];
  onCategoryChange: (id: number, category: string) => void;
  onPublisherChange: (id: number, publisher: string) => void;
  onDelete: (id: number) => void;
  onUpdateBookField: (id: number, field: keyof Book, value: string) => void;
};

const getPublisherBgColor = (publisher: string) => {
  switch (publisher) {
    case "LuckPim":
      return "bg-green-100";
    case "SiamInterCommic":
      return "bg-red-100";
    case "Phonix Next":
      return "bg-blue-100 text-blue-800";
    case "FirstPage":
      return "bg-blue-300";
    case "Zenshu":
      return "bg-red-400";
    case "Dex":
      return "bg-orange-300";
    default:
      return "";
  }
};

const BookTable: React.FC<Props> = ({
  books,
  categories,
  publishers,
  onCategoryChange,
  onPublisherChange,
  onDelete,
  onUpdateBookField,
}) => {
  const [editingId, setEditingId] = useState<number | null>(null);
  const [editingTitle, setEditingTitle] = useState("");
  const [editingImageId, setEditingImageId] = useState<number | null>(null);
  const [editingImageUrl, setEditingImageUrl] = useState("");

  const handleEditTitle = (id: number, currentTitle: string) => {
    setEditingId(id);
    setEditingTitle(currentTitle);
  };

  const handleSaveTitle = (id: number) => {
    if (editingTitle.trim()) {
      onUpdateBookField(id, "title", editingTitle.trim());
    }
    setEditingId(null);
    setEditingTitle("");
  };

  const handleEditImage = (id: number, currentUrl: string) => {
    setEditingImageId(id);
    setEditingImageUrl(currentUrl);
  };

  const handleSaveImage = (id: number) => {
    if (editingImageUrl.trim()) {
      onUpdateBookField(id, "image", editingImageUrl.trim());
    }
    setEditingImageId(null);
    setEditingImageUrl("");
  };

  return (
    <div className="overflow-x-auto rounded-xl shadow-md bg-white">
      <table className="w-full min-w-[700px] table-auto text-sm text-gray-700">
        <thead>
          <tr className="bg-indigo-100 text-indigo-800">
            <th className="px-4 py-3 text-left font-semibold">รูปภาพ</th>
            <th className="px-4 py-3 text-left font-semibold">ชื่อเรื่อง</th>
            <th className="px-4 py-3 text-left font-semibold">แนว</th>
            <th className="px-4 py-3 text-left font-semibold">สำนักพิมพ์</th>
            <th className="px-4 py-3 text-center font-semibold">จำนวนเล่ม</th>
            <th className="px-4 py-3 text-center font-semibold">ลบ</th>
          </tr>
        </thead>
        <tbody>
          {[...books]
            .sort((a, b) => b.quantity - a.quantity)
            .map((book) => (
              <tr
                key={book.id}
                className="border-b hover:bg-gray-50 transition duration-200"
              >
                {/* รูปภาพ */}
                <td className="px-4 py-3">
                  {editingImageId === book.id ? (
                    <input
                      type="text"
                      value={editingImageUrl}
                      onChange={(e) => setEditingImageUrl(e.target.value)}
                      onBlur={() => handleSaveImage(book.id)}
                      onKeyDown={(e) => {
                        if (e.key === "Enter") handleSaveImage(book.id);
                      }}
                      autoFocus
                      className="border border-indigo-300 px-2 py-1 rounded-md w-full focus:outline-none focus:ring-2 focus:ring-indigo-400"
                    />
                  ) : (
                    <img
                      src={book.image || "/no-image.png"}
                      alt={book.title}
                      className="w-16 h-24 object-cover mx-auto rounded-lg shadow cursor-pointer"
                      onClick={() => handleEditImage(book.id, book.image)}
                    />
                  )}
                </td>

                {/* ชื่อเรื่อง */}
                <td className="px-4 py-3">
                  {editingId === book.id ? (
                    <input
                      type="text"
                      value={editingTitle}
                      onChange={(e) => setEditingTitle(e.target.value)}
                      onBlur={() => handleSaveTitle(book.id)}
                      onKeyDown={(e) => {
                        if (e.key === "Enter") handleSaveTitle(book.id);
                      }}
                      autoFocus
                      className="border border-blue-300 px-2 py-1 rounded-md w-full focus:outline-none focus:ring-2 focus:ring-blue-400"
                    />
                  ) : (
                    <span
                      onClick={() => handleEditTitle(book.id, book.title)}
                      className="cursor-pointer hover:underline"
                    >
                      {book.title}
                    </span>
                  )}
                </td>

                {/* หมวดหมู่ */}
                <td className="px-4 py-3">
                  <select
                    value={book.category}
                    onChange={(e) => onCategoryChange(book.id, e.target.value)}
                    className="w-full rounded-md border px-2 py-1 bg-white shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-300"
                  >
                    {categories.map((category) => (
                      <option key={category} value={category}>
                        {category}
                      </option>
                    ))}
                  </select>
                </td>

                {/* สำนักพิมพ์ */}
                <td
                  className={`px-4 py-3 ${getPublisherBgColor(book.publisher)}`}
                >
                  <select
                    value={book.publisher}
                    onChange={(e) => onPublisherChange(book.id, e.target.value)}
                    className="w-full rounded-md border px-2 py-1 bg-white shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-300"
                  >
                    {publishers.map((publisher) => (
                      <option key={publisher} value={publisher}>
                        {publisher}
                      </option>
                    ))}
                  </select>
                </td>

                {/* จำนวนเล่ม */}
                <td className="px-4 py-3 text-center">
                  <input
                    type="number"
                    min={0}
                    value={book.quantity}
                    onChange={(e) =>
                      onUpdateBookField(book.id, "quantity", e.target.value)
                    }
                    className="w-20 border rounded-md px-2 py-1 text-center focus:outline-none focus:ring-2 focus:ring-green-300"
                  />
                </td>

                {/* ปุ่มลบ */}
                <td className="px-4 py-3 text-center">
                  <button
                    onClick={() => onDelete(book.id)}
                    className="text-red-500 font-medium hover:text-red-700 transition"
                  >
                    ลบ
                  </button>
                </td>
              </tr>
            ))}
        </tbody>
      </table>
    </div>
  );
};

export default BookTable;
