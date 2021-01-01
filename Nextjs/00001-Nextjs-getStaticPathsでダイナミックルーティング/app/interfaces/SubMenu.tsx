import { Menu } from './Menu'

export type SubItem = {
  subMenuId: string
}

// Menu型とSubItem型をマージ
// https://qiita.com/markey/items/134386ee98b277f181f7#intersection
export type SubMenu = Menu & SubItem
