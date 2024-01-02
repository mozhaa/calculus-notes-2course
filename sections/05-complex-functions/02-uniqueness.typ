#import "../../utils/core.typ": *

== Теорема о единственности

#lemma[
  $Omega$ --- область в метрическом пространстве, $E subset Omega$. Если $E != nothing$, $E$ открыто в $Omega$ и замкнуто в $Omega$, то $E = Omega$.
]

#proof[
  Рассмотрим
  $ f(x) = cases(1 "при" x in E, 0 "при" x in Omega without E). $
  Эта функция непрерывна в $Omega$, так как прообраз открытого множества открыт в $Omega$. Значит
  $
    nothing, E, Omega without E, Omega
  $
  открытые в $Omega$. Тогда если у $f$ есть значение $0$, то по теореме Больцано-Коши, $f$ принимает все промежуточные значения, то есть, например $1/2$. Такого быть не может, значит $E = Omega$ (вариант $E = nothing$ запрещен по условию.)
]

#th(name: "о единственности")[
  $f in H(Omega)$, $z_0 in Omega$. Следующие условия равносильны:
  1. Все производные $f^((n)) (z_0) = 0$.
  2. $f equiv 0$ в окрестности $z_0$.
  3. $f equiv 0$ в $Omega$.
]

#proof[
  - "$1 ==> 2$": разложим по Тейлору. В круге сходимости --- это тождественный нуль.
  - "$2 ==> 1$": очевидно.
  - "$3 ==> 2$": очевидно.
  - "$2 ==> 3$": Рассмотрим в качестве $E$ множество точек, в окрестностях которых, функция равна $0$:
    $ E := {z in Omega: exists U_z space f(U_z) equiv 0}. $
    Так как $z_0 in E$, $E != nothing$. По построению, $E$ открыто. Докажем, что $E$ замкнуто: рассмотрим последовательность $z_n in E$ такую, что $z_n --> z_*$. Тогда $0 = f^((k)) (z_n) -->_(n -> oo) f^((k)) (z_*)$, так как $f^((k))$ непрерывны. Пользуемся выводом $1 ==> 2$ для $z_*$.
]

#follow[
  Если $f, g in H(Omega)$ и $f = g$, в окрестности $z_0 in Omega$, то $f = g$ в $Omega$.
]

#proof[
  Рассмотрим разность. Она нуль в окрестности, значит по теореме нуль везде.
]

#th(name: "о среднем")[
  $f in H(Omega)$, $a in Omega$, такие, что круг $abs(z - a) <= r$ содержится в $Omega$. Тогда 
  $
    f(a) = 1 / (2pi) integral_0^(2pi) f(a + r e^(i t)) dif t.
  $
  Иными словами, значение функции в точке --- среднее значение функции на окружности с центром в этой точке.
]

#proof[
  Запишем интегральную формулу Коши:
  $
    f(a) = 1/(2 pi i) integral_(abs(z - a) = r) f(z) / (z - a) dif z.
  $
  Положим $z = a + r e^(i t)$ --- параметризация окрестности $abs(z - a) = r$, $dif z = r e^(i t) dot i dif t$. Тогда
  $
    f(a) = 1/(2 pi i) integral_(abs(z - a) = r) f(z) / (z - a) dif z = 1/(2 pi cancel(i)) integral_0^(2 pi) f(a + r e^(i t)) (cancel(r e^(i t)) cancel(i))/(cancel(r e^(i t))) dif t = 1 / (2pi) integral_0^(2pi) f(a + r e^(i t)) dif t.
  $
]

#follow[
  При условии теоремы, также верно
  $
    f(a) = 1 / (pi r^2) integral_(abs(z - a) <= r) f(z) dif x dif y.
  $
  То есть значение функции в точке --- среднее значение функции в круге с центром в этой точке.
]

#proof[
  Считаем интеграл:
  $
    integral_(abs(z - a) <= r) f(z) dif x dif y = integral_0^r integral_0^(2 pi) f(a + rho e^(i t)) rho dif t dif rho = integral_0^r f(a) dot 2pi rho dif rho = f(a) dot cancel(2) pi dot r^2/cancel(2) = pi r^2 f(a).
  $
]

#th(name: "Принцип максимума")[
  Пусть $f in H(Omega)$. $a in Omega$ --- локальный максимум модуля, то есть $abs(f(z)) <= abs(f(a))$ для $forall z in U_a$. Тогда функция --- константа.
]


#proof[
  Пусть $M = abs(f(a))$ --- максимум по модулю. Если $M = 0$, то функция равна нулю в окрестности, и по теореме о единсвенности, везде. 

  Если $M > 0$, то домножим функцию на константу вида $e^(-i alpha)$ так, чтобы $f(a) = M$. Значение в точке станет положительным. Запишем интегральную формулу:
  $
    M = f(a) = 1/(2pi) integral_0^(2pi) f(a + r e^(i t)) dif t.
  $
  Так как справа интеграл положительный, можно навесить на него модуль. Более того, значения можно сравнивать как вещественные:
  $
    M = f(a) = 1/(2pi) abs(integral_0^(2pi) f(a + r e^(i t)) dif t) <= 1/(2pi) integral_0^(2pi) underbrace(abs(f(a + r e^(i t))), M) dif t <= 1/(2pi) integral_0^(2pi) M dif t = M.
  $
  Получилась цепочка неравенств значений между $M$ и $M$. Значит все неравенства в ней равенства. $abs(f(a + r e^(i t)))$ в какой-то окрестности не $M$, то интеграл будет поменьше. Значит $abs(f(a + r e^(i t))) = M$ везде из непрерывности. Более того,
  $
    M = f(a) = 1/(2pi) Re integral_0^(2pi) f(a + r e^(i t)) dif t = 1/(2pi) integral_0^(2pi) underbrace(Re f(a + r e^(i t)), <= M) dif t <= 1/(2pi) integral_0^(2pi) M dif t = M.
  $
  Снова везде равентсва. Аналогично получается, что $Re f(a + r e^(i t)) = M$. Получается, и модуль, и вещественная часть везде равна $M$. Тогда для каждой точки круга, $f(a + r^e^(i t)) = M space forall r <= R space forall t$, а значит $f(z) = M$ для всех $z$ в круге, и по теореме о единственности, $f = const$.
]

#follow[
  Пусть $Omega$ --- ограниченная область, $f in H(Omega)$ и $f in C(Cl Omega)$. Тогда $max_(z in Cl Omega) abs(f(z))$ достигается на границе.
]

#proof[
  $Cl Omega$ --- компакт. Значит максимум где-то достигается. Пусть не на границе. Тогда по принципу максимума, функция константа. Но тогда максимум на границе тоже достигается.
]

Тривиа: из таких теорем можно делать какие-то выводы из гидродинамики. Например, для несжимаемых жидкостей, если рассмотреть их в одной плоскости, то скорость жидкости в точке описывается голоморфной функцией. Тогда можно понять, что максимальная скорость достигается на границе. Лет 70 назад, почти все расчеты в гидродинамике в приближении несжимаемой жидкости делались с помощью голоморфных функций. Аналогичным образом можно симулировать течение воздуха вокруг крыла самолета в простых случаях (воздух все-таки сжимаем), или поведение толпы.

#def[
  Пусть $f in H(Omega)$, $a = Omega$. $a$ --- _нуль голоморфной функции_ $f$, если $f(a) = 0$.
]

#th[
  Пусть $f in H(Omega)$, $f(z_0) = 0$, $f equiv.not 0$. Тогда существует $m in NN$ и $g in H(Omega)$ такая, что $g(z_0) != 0$ и $f(z) = (z - z_0)^m g(z)$. В частности, $f(z) != 0$ в некоторой проколотой окрестности $z_0$. Такое $m$ называется _кратностью нуля_.
]

#proof[
  Рассмотрим разложение $f(z) = sum_(n = 0)^oo a_n (z - z_0)^n$, в нем не все $a_n$ нули. Возьмем в качетстве $m := min {k: a_k != 0} >= 1$ --- минимальный индекс, в котором значение $0$ (напомню, что $a_0$ равно нулю, так как $z_0$ --- корень, и $m >= 1$). 
  Тогда 
  $
    f(z) = (z - z_0)^m sum_(n = 0)^oo a_(n + m) (z - z_0)^n.
  $
  Определим
  $
    g(z) := cases(
      f(z)/(z - z_0)^m "при" z != z_0,
      a_m "при" z = z_0
    )
  $
  Надо проверить голоморфность. При $z != z_0$ очевидно: это степенной ряд. При $z = z_0$, это предел функции $f(z)/(z - z_0)^m$ при $z -> z_0$, значит функция непрерывна. У нас была теорема, что если непрерывная функция голоморфна без точки, то она все равно голоморфна везде. Значит $g$ голоморфна везде. 
  
  Наконец, $g(z) != 0$ в окрестности $z_0$ по непрерывности, значит $f(z) != 0$ в проколотой окрестности $z_0$.
]

#follow[
  Пусть $f, g in H(Omega)$, и $f dot g equiv 0$. Тогда либо $f equiv 0$, либо $g equiv 0$.
]

#proof[
  Пусть $g equiv.not 0$. Берем $z_0 in Omega$ такое, что $g(z_0) != 0$. Тогда $f(z_0) = 0$ а окрестности, и $f(z) != 0$ в $circle(U)_(z_0)$. Тогда $g equiv 0$ в $circle(U)_(z_0)$, так как $f dot g equiv 0$.

  #TODO[вычитать]
]

#follow[
  Множество нулей голоморфной функции $f equiv.not 0$ состоит из изолированных точек.
]

#proof[
  Очевидно по теореме: около каждого нуля есть проколотая окрестность, в которой функция не равна нулю.
]

#th(name: "о единственности, вторая версия")[
  Пусть $f, g in H(Omega)$ и $E := {z in Omega : f(z) = g(z)}$. Если $E$ имеет предельную точку в $Omega$, то $f equiv g$ в $Omega$.
]

#proof[
  Пусть $z_n in E$ и $lim z_n = z_0 in Omega$. Пусть $h := f - g$. Тогда $h(z_n) = 0$, и по непрерывности $h(z_0) = 0$.

  Но тогда $z_0$ не изолированный нуль $h$, значит $h equiv 0$ в $Omega$.
]

#notice[
  Здесь важно, что $z_0$ попал в $Omega$. Рассмотрим, например, $Omega := CC without {0}$, $f(z) = sin 1/z$, $g(z) equiv 0$. Тогда если рассмотреть $z_n = 1/(pi n)$, то $lim z_n = 0 in.not Omega$, но $f(z_n) = 0 = g(z_n)$, хотя $f equiv.not g$.
]

#follow[
  Докажем какое-нибудь следствие. Напрмер, $sin^2 z + cos^2 z = 1$. Мы знаем, что оно выполняется для вещественных аргументов, из кружка 8-го класса школы. Тогда по принципу единственности, оно выполняется везде. Любые формулы над голоморфными функциями верные на $RR$, верны везде.
]