'use client';
import React from 'react';

type Props = {
  newBook: {
    title: string;
    category: string;
    publisher: string;
    image: string; // เพิ่มช่องสำหรับใส่ URL รูปภาพ
  };
  categories: string[];
  publishers: string[];
  onChange: (field: string, value: string) => void;
  onAdd: () => void;
};

const BookForm: React.FC<Props> = ({
  newBook,
  categories,
  publishers,
  onChange,
  onAdd,
}) => {
  return (
    <div className="mb-6">
      <h3 className="text-lg font-semibold mb-2">➕ เพิ่มหนังสือ</h3>

      <input
        type="text"
        placeholder="ชื่อหนังสือ"
        value={newBook.title}
        onChange={(e) => onChange('title', e.target.value)}
        className="p-2 border rounded mr-2"
      />

      <input
        type="text"
        placeholder="URL รูปภาพ"
        value={newBook.image}
        onChange={(e) => onChange('image', e.target.value)}
        className="p-2 border rounded mr-2"
      />

      <select
        value={newBook.category}
        onChange={(e) => onChange('category', e.target.value)}
        className="p-2 border rounded mr-2"
      >
        {categories.map((c) => (
          <option key={c} value={c}>
            {c}
          </option>
        ))}
      </select>

      <select
        value={newBook.publisher}
        onChange={(e) => onChange('publisher', e.target.value)}
        className="p-2 border rounded mr-2"
      >
        {publishers.map((p) => (
          <option key={p} value={p}>
            {p}
          </option>
        ))}
      </select>

      <button
        onClick={onAdd}
        className="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded"
      >
        เพิ่ม
      </button>
    </div>
  );
};

export default BookForm;
