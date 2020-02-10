
#https://memo.sugyan.com/entry/20090329/1238305558
# 渡された配列から $m 個を選ぶ順列を返すサブルーチン
sub permutation {
    my $m = shift;
    return ([]) if ($m == 0);

    my @results = ();
    for (0..$#_) {
        my $elem = $_[$_];
        # 渡された要素から１つを選び出し、残った配列を @array とする
        my @array = @_;
        splice(@array, $_, 1);
        # 選び出した１つの要素と、残りの配列から生成される順列をそれぞれ繋げる(再帰処理)
        for my $perm (&permutation($m - 1, @array)) {
            my $result = [$elem, @$perm];
            push(@results, $result);
        }
    }

    return @results;
}
