<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCourseRatingAndCourseRatingCriteriasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('course_rating_and_course_rating_criterias', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('course_rating_criterias_id');
            $table->unsignedBigInteger('course_ratings_id');
            $table->enum('rating',[]);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('course_rating_and_course_rating_criterias');
    }
}
