<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCourseRatingNotificationRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('course_rating_notification_requests', function (Blueprint $table) {
            $table->id();
            $table->string('username');
            $table->timestamp('answered_at');
            $table->enum('status',[]);
            $table->unsignedBigInteger('course_ratings_id');
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
        Schema::dropIfExists('course_rating_notification_requests');
    }
}
