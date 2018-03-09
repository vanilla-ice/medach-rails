<template lang="pug">
  .container
    .article__wrapper
      .article
        .article-title
          | Генная терапия:
          br
          | стереть сереповидно-клеточную анемию
        .article-info__wrapper
          .article-info
            .article-info__item.publishing
              | Оригинал
            .article-info__item.transfer
              | Перевод: Koyaanis Katsi
            .article-info__item.revision
              | Редакция: Елена Бреславец, Михаил Гусев
            .article-info__item.cover
              | Обложка: Cornu Ammonis
          .date
            | Февраль 3, 2018
        .content
          .content-header
            img.content-header__image(src="../static/images/dies-irae.png")
            p.content-header__title
              | Содержание:
            p
              | Введение
            p
              | Молекулярное заболевание
            p
              | Редактирование строки
            p
              | Известные неизвестные
          div.content-main
            p
              | Довольно скоро мы узнаем, можно ли с помощью генной инженерии излечить ряд крайне тяжелых заболеваний, связанных с нарушением синтеза гемоглобина.
            p 
              | Мэттью Портеус (Matthew Porteus) вспоминает первый в своей практике случай серповидно-клеточного криза. Молодая женщина страдала от глубокой, сильной боли в одной из ее конечностей. Такая боль, вызванная закупоркой кровеносных сосудов, часто встречается у людей с серповидно-клеточной анемией.
            p
              | Выяснив, чем больна пациентка, Портеус понял, в чем кроется причина ее проблем — это точечная мутация в одном из генов, кодирующих часть гемоглобина — белка, переносящего кислород и присутствующего в эритроцитах. Но ни он, ни любой другой врач не могли помочь пациентке чем-либо, кроме снятия боли. «Мы знаем, что серповидно-клеточная анемия связана с конкретным геном и конкретными клетками, но все, что мы можем сделать — это обеспечить регидратацию и снять боль», — говорит Портеус. Он знал, что его пациентка и другие подобные больные вновь будут страдать от болевых кризов и нарастающего поражения органов и будут возвращаться в больницу.
            img(src="../static/images/vaccine-wars.jpg")
            i.img-info
              | Медицинское учреждение в Киншасе (Демократическая Республика Конго) предлагает лечение серповидно-клеточной анемии.
            h3.content-main__title
              | Молекулярное заболевание
            p
              | Гематологов особенно расстраивает отсутствие лекарства от серповидно-клеточной анемии, поскольку это заболевание встречается достаточно часто и хорошо изучено.
            p
              | Дефект гемоглобина, лежащий в основе развития серповидно-клеточной анемии, описан в 1949 году Лайнусом Полингом и его коллегами [1]. Полинг же придумал термин «молекулярное заболевание» для описания этиологии серповидно-клеточной анемии. Восемь лет спустя исследователь обнаружил расположение и природу [2] мутации в гене, кодирующем β-глобин — один из двух типов субъединиц гемоглобина у взрослых. Впоследствии ученые изучили эту мутацию и показали, что она заключается в однонуклеотидной замене аденина на тимин. Сама молекула гемоглобина состоит из четырех частей: двух субъединиц β-глобина и двух субъединиц α-глобина. Когда обе копии гена β-глобина человека содержат мутацию, гемоглобин в их эритроцитах полимеризуется и искажает клетки, придавая им характерную серповидную форму.
</template>

<script>
  export default {
    
  }
</script>

<style lang="scss" scoped>
  .article__wrapper {
    max-width: 1380px;
    width: 100%;
    margin: 0 auto;
    margin-top: 20px;
    margin-bottom: 40px;
    padding: 40px 30px 90px 77px;


    background: #fff;
    border-radius: 8px;
  }

  .article {
    max-width: 893px;
    width: 100%;
  }

  .article-title {
    font-family: Montserrat-Medium, helvetica;
    font-size: 30px;
  }

  .article-info__wrapper{
    display: flex;
    justify-content: space-between;
    padding-top: 40px;
    padding-bottom: 40px;

    font-size: 16px;
    font-family: Montserrat-Regular, helvetica;
    color: #ACACAC;
  }

  .article-info {
    max-width: 500px;
    width: 100%;
  }

  .date {
    max-width: 160px;
    width: 100%;
    text-align: right;
    margin-top: auto;
  }

  .content-header {
    font-family: Montserrat-Medium, helvetica;
    font-size: 22px;
  }

  .content-header__image {
    width: 100%;
  }

  .content-header p {
    margin-top: 24px;
    padding-left: 23px;
    padding-right: 23px;
  }

  .content-header .content-header__title {
    margin-top: 40px;
    font-size: 26px;
  }

  .content-main {
    margin-top: 40px;
    font-family: serif;
    font-size: 22px;
    line-height: 26px;
  }

  .content-main p {
    padding-left: 23px;
    padding-right: 20px;
    margin-top: 24px;
  }

  .content-main img {
    width: 100%;
  }

  h3.content-main__title {
    margin-top: 40px;
    padding-left: 23px;
    padding-right: 20px;

    font-weight: normal;
    font-family: Montserrat-Regular, helvetica;
    font-size: 26px;
  }

  .img-info {
    margin-top: 20px;
  }

  @media (max-width: 1024px) {
    .article__wrapper {
      padding-left: 30px;
      padding-right: 30px;
    }
  }
</style>