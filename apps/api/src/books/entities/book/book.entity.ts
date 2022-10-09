import { BaseEntity } from '../../../common/base.entity';
import { Author } from '../author/author.entity';
import { Genre } from '../genre/genre.entity';

export class Book extends BaseEntity {
  constructor(
    id: string,
    private readonly title: string,
    private readonly author: Author,
    private readonly genre: Genre,
    private readonly description?: string,
    private readonly publishedAt: Date = new Date(),
    private readonly registeredAt: Date = new Date(),
  ) {
    super(id);
  }

  getTitle(): string {
    return this.title;
  }

  getAuthor(): Author {
    return this.author;
  }

  getGenre(): Genre {
    return this.genre;
  }

  getDescription(): string | null | undefined {
    return this.description;
  }

  getPublishedAt(): Date {
    return this.publishedAt;
  }

  getRegisteredAt(): Date {
    return this.registeredAt;
  }
}
