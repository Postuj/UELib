export class BookDto {
  id: string;
  title: string;
  description?: string;
  publishedAt: Date;
  author: {
    id: string;
    name: string;
    surname: string;
  };
  genre: {
    id: string;
    name: string;
  };
}
