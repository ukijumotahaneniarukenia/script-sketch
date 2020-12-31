import { User } from '../interfaces/User'

export let userDataList: User[] = [
  { id: 'TZ3DQUO4GTiBKq5OkaJvDR7al7YREfjI', name: 'サウナ' },
  { id: '8lT0pahKUslDKXpGybuviJAxFei3nG3r', name: 'ヨメナ' },
  { id: 't0OwhfUTAeDqeLZ6Zg57WTApA742aO6a', name: 'ツバナ' },
  { id: 'y90LCvTJGQRmzevuTWbAKAhEO7TU849P', name: 'セミナ' },
  { id: 'l2mbgGDcorvVMI6b3SZOERl6J93MmMdV', name: 'クイナ' },
  { id: 'mqFdAdeb06lRvJatO58q5c0DxOiH0S8R', name: 'ムジナ' },
  { id: 'eDh9HaCKK4AQTfVUPbm4bNiyRCi54Ayp', name: 'スズナ' },
  { id: '4Al5IAHVWhSEe2zrgoyigzrAI93W2wCF', name: 'コーナ' },
  { id: 'EqTmhQtJgAoG69SJACcpNCLEjqTnG1VM', name: 'ミズナ' },
  { id: 'tR5pWfzVYiUZt6UfUyrzaY7qarx9xO9u', name: 'セスナ' },
  { id: 'n5bAvZDD4Yo7qoS6HHUIcf6ZKDu5tgRZ', name: 'ツルナ' },
  { id: 'kzRyYW4rGYEj2pt5NXJWNZmzBXXoSOCH', name: 'タマナ' },
  { id: 'yWDBvt2vYr8TsRqHeYvcpqwT3d5QPQot', name: 'ワギナ' },
  { id: 'wKimQvf6ZF0usL13pATfGpsARHsRW0r1', name: 'カンナ' },
  { id: 'BcyqHnNCXpqYhuPkzuRsACjOOcnTxkGt', name: 'イワナ' },
  { id: 'X40JSEXLpooexCponGwaormhSc2H2zHa', name: 'サカナ' },
  { id: 'dPud3XomMHzSGdroixD8wo3FKdPc7xVS', name: 'バナナ' },
  { id: 'xEpXYagtZCNMTcHz0qLVtexEQNfXGtCA', name: 'スギナ' },
  { id: 'HwIPWrvm7plopeUBCNaCqaas9n01Pnbk', name: 'タカナ' },
  { id: 'vjH35nKOtiopav6pHAFRV6npkqaGVURm', name: 'メバナ' }
]

const setUserDataList = (targetUserDataList: User[]) => {
  userDataList = targetUserDataList
}

export default setUserDataList
