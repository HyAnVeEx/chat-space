# データベース設計
## users table
| Column |  Type  |                    Options                    |
|--------|--------|-----------------------------------------------|
| name   | string | null: false, foreign_key: true , unique: true |
| mail   | string | null: false, foreign_key: true , unique: true |

### Association
- has_many :groups , through:members
- has_many :messages
- has_many :members

## messages table
|  Column |   Type   |   Options    |
|---------|----------|--------------|
| message | text     | null: false, |
| user_id | interger | null: false, |

### Association
- belong_to :user
- belong_to :group


## group table
| Column |  Type  |   Options    |
|--------|--------|--------------|
| name   | string | null: false, |

### Association
- has_many :users , through:members
- has_many :messages

## membersテーブル
|  Column  |   Type  |            Options             |
|----------|---------|--------------------------------|
| user_id  | integer | null: false, foreign_key: true |
| group_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :group
- belongs_to :user
