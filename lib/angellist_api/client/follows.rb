module AngellistApi
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/follows
    module Follows
      # Makes the authenticated user follow the specified item. Returns the new
      # follow on success, or an error on failure.
      #
      # @requires_authentication Yes
      #
      # @param [Hash] options A customizable set of options.
      # @option options [String] :type Must be either user or startup.
      # @option options [Integer] :id The id of the user or startup to start following.
      #
      # @example Follow a startup with the authenticated user.
      #   AngellistApi.new_follow(:type => :startup, :id => 12345)
      def new_follow(options={})
        post("1/follows", options)
      end

      # Makes the authenticated user stop following the specified item. Returns
      # the deleted follow on success, or an error on failure.
      #
      # @requires_authentication Yes
      #
      # @param [Hash] options A customizable set of options.
      # @option options [String] :type Must be either user or startup.
      # @option options [Integer] :id The id of the user or startup to start following.
      #
      # @example Make the authenticated user stop following a startup.
      #   AngellistApi.delete_follow(:type => :startup, :id => 12345)
      def delete_follow(options={})
        delete("1/follows", options)
      end

      # Returns whether the source and target profiles follow each other. The source
      # key will contain the follow from the source to the target, if it exists.
      # The target key will contain the follow from the target to the source, if it
      # exists. Otherwise null is returned.
      #
      # @requires_authentication Optional
      #
      # @param [Hash] options A customizable set of options.
      # @option options [Integer] :source_id The id of the source User. Cannot be a Startup id since Startups cannot follow things.
      # @option options [String] :target_type Must be either User or Startup.
      # @option options [Integer] :target_id The id of the target, either a User id or Startup id.
      #
      # @example  Check if two users follow each other.
      #   AngellistApi.get_relationship(:source_id => 671, :target_type => 'User', :target_id => 2)
      def get_relationship(options={})
        get('1/follows/relationship', options)
      end

      # Returns the follower and followed information based on comma-separated
      # follow ids, such as those from the activity feed.
      #
      # @requires_authentication Optional
      # @paginated No
      #
      # @param ids [Array] IDs of the follows to fetch.
      #
      # @example Get follower and followed information for a batch of follows.
      #   AngellistApi.get_follows([1, 2, 3])
      def get_follows(ids)
        params = { :ids => ids.join(',') }
        get("1/follows/batch", params)
      end

      # Return the given user's followers, paginated and ordered by most recent
      # follower first.
      #
      # @requires_authentication No
      # @paginated Yes
      #
      # @param [Integer] id The id of the given user.
      # @param [Hash] options A customizable set of options.
      #
      # @example Get followers of user with ID 12345.
      #   AngellistApi.get_user_followers(12345)
      def get_user_followers(id, options={})
        get("1/users/#{id}/followers", options)
      end

      # Return the ids of the given user's followers, paginated and ordered by
      # most recent follower first.
      #
      # @requires_authentication No
      # @paginated Yes
      #
      # @param [Integer] id The id of the given user.
      # @param [Hash] options A customizable set of options.
      #
      # @example Get IDs of the followers of user with ID 12345.
      #   AngellistApi.get_user_follower_ids(12345)
      def get_user_follower_ids(id, options={})
        get("1/users/#{id}/followers/ids", options)
      end

      # Return objects that the given user is following, paginated and ordered
      # by most recent follow first. See the type parameter to specify which
      # class of objects to return.
      #
      # @requires_authentication Optional
      # @paginated Yes
      #
      # @param [Integer] id The id of the given user.
      # @param [Hash] options A customizable set of options.
      # @option options [String] :type ('user') Must be either user or startup.
      #
      # @example Get startups that user with ID 1234 is following.
      #   AngellistApi.get_user_following(1234, :type => :startup)
      def get_user_following(id, options={})
        get("1/users/#{id}/following", options)
      end

      # Return ids of objects that the given user is following, paginated and
      # ordered by most recent follow first. See the type parameter to specify
      # which class of objects to return. Responds like GET
      # /users/:id/followers/ids.
      #
      # @requires_authentication Optional
      # @paginated Yes
      #
      # @param [Integer] id The id of the given user.
      # @param [Hash] options A customizable set of options.
      # @option options [String] :type ('user') Must be either user or startup.
      #
      # @example Get IDs of startups that user with ID 1234 is following.
      #   AngellistApi.get_user_following_ids(1234, :type => :startup)
      def get_user_following_ids(id, options={})
        get("1/users/#{id}/following/ids", options)
      end

      # Returns the given startup's followers, paginated and ordered by most
      # recent follower first. Responds like GET /users/:id/followers.
      #
      # @requires_authentication Optional
      # @paginated Yes
      #
      # @param [Integer] id The id of the given startup.
      # @param [Hash] options A customizable set of options.
      #
      # @example Get followers of startup with ID 1234.
      #   AngellistApi.get_startup_followers(1234)
      def get_startup_followers(id, options={})
        get("1/startups/#{id}/followers", options)
      end

      # Returns the ids of the given startup's followers, paginated and ordered
      # by most recent follower first. Responds like GET /users/:id/followers.
      #
      # @requires_authentication Optional
      # @paginated Yes
      #
      # @param [Integer] id The id of the given user.
      # @param [Hash] options A customizable set of options.
      #
      # @example Get IDs of followers of startup with ID 1234.
      #   AngellistApi.get_startup_follower_ids(1234)
      def get_startup_follower_ids(id, options={})
        get("1/startups/#{id}/followers/ids", options)
      end
    end
  end
end

