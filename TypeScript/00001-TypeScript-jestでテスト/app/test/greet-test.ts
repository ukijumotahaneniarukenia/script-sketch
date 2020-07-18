import greet from '../src/greet';


// ここのコンパイルエラーはtestディレクトリをワークスペースと読み込めば、解消される

describe('greet-NG', (): void => {
    test('should say hello to Tom.', (): void => {
        const response: string = greet('Tom');
        expect(response).toBe('へろー, Tom!');
    });
})


describe('greet-OK', (): void => {
    test('should say hello to Tom.', (): void => {
        const response: string = greet('Tom');
        expect(response).toBe('Hello, Tom!');
    });
})

describe('greet-OK', (): void => {
    test('should say hello to Tom.', (): void => {
        const response: string = greet('Tom');
        expect(response).toBe('Hi, Tom!');
    });
})


