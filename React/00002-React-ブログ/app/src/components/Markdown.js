import React from 'react';
import ReactMarkdown from 'markdown-to-jsx';

const md = `
# DatePicker

The DatePicker works by supplying a date to bias towards,
as well as a default timezone.

## うんこ

### 静的サイトジェネレータを使おう

`;

function Markdown(props) {
  return <ReactMarkdown children={md} />
}

export default Markdown
