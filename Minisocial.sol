// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiniSocial {
    struct Post {
        string message;
        address author;
        uint likeCount;
        uint dislikeCount;
        uint timestamp;
        uint modifiedAt;
    }

    Post[] private posts;
    mapping(uint => address) public postLikes;
    mapping(uint => address) public postDislikes;

    // Event for new post
    event NewPost(address indexed author, uint postId, string message);

    function publishPost(string memory _message) public {
        uint postId = posts.length;
        posts.push(Post({
            message: _message,
            author: msg.sender,
            likeCount: 0,
            dislikeCount: 0,
            timestamp: block.timestamp,
            modifiedAt: 0
        }));
        emit NewPost(msg.sender, postId, _message);
    }

    function getPost(uint index) public view returns (string memory, address, uint, uint, uint, uint) {
        require(index < posts.length, "Index out of range");
        Post memory post = posts[index];
        return (post.message, post.author, post.likeCount, post.dislikeCount, post.timestamp, post.modifiedAt);
    }

    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }

    function likePost(uint postId) public {
        require(postId < posts.length, "Post does not exist");
        Post storage post = posts[postId];
        require(postLikes[postId] != msg.sender, "Already liked this post");

        // Remove dislike if exists
        if (postDislikes[postId] == msg.sender) {
            post.dislikeCount--;
            postDislikes[postId] = address(0);
        }

        post.likeCount++;
        postLikes[postId] = msg.sender;
    }

    function dislikePost(uint postId) public {
        require(postId < posts.length, "Post does not exist");
        Post storage post = posts[postId];
        require(postDislikes[postId] != msg.sender, "Already disliked this post");

        // Remove like if exists
        if (postLikes[postId] == msg.sender) {
            post.likeCount--;
            postLikes[postId] = address(0);
        }

        post.dislikeCount++;
        postDislikes[postId] = msg.sender;
    }

    function modifyPost(uint postId, string memory newMessage) public {
        require(postId < posts.length, "Post does not exist");
        Post storage post = posts[postId];
        require(post.author == msg.sender, "You are not the owner of this post");

        post.message = newMessage;
        post.modifiedAt = block.timestamp;
    }
}
