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
    mapping(address => mapping(uint => bool)) public likedPosts;
    mapping(address => mapping(uint => bool)) public dislikedPosts;

    // Event for new post
    event NewPost(address indexed author, uint postIndex, string message);

    function publishPost(string memory _message) public {
        posts.push(Post({
            message: _message,
            author: msg.sender,
            likeCount: 0,
            dislikeCount: 0,
            timestamp: block.timestamp,
            modifiedAt: 0
        }));
        emit NewPost(msg.sender, posts.length - 1, _message);
    }

    function getPost(uint index) public view returns (string memory, address, uint, uint, uint, uint) {
        require(index < posts.length, "Index out of range");
        Post memory post = posts[index];
        return (post.message, post.author, post.likeCount, post.dislikeCount, post.timestamp, post.modifiedAt);
    }

    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }

    function likePost(uint index) public {
        require(index < posts.length, "Post does not exist");
        Post storage post = posts[index];
        require(!likedPosts[msg.sender][index], "Already liked this post");

        // Remove dislike if exists
        if (dislikedPosts[msg.sender][index]) {
            post.dislikeCount--;
            dislikedPosts[msg.sender][index] = false;
        }

        post.likeCount++;
        likedPosts[msg.sender][index] = true;
    }

    function dislikePost(uint index) public {
        require(index < posts.length, "Post does not exist");
        Post storage post = posts[index];
        require(!dislikedPosts[msg.sender][index], "Already disliked this post");

        // Remove like if exists
        if (likedPosts[msg.sender][index]) {
            post.likeCount--;
            likedPosts[msg.sender][index] = false;
        }

        post.dislikeCount++;
        dislikedPosts[msg.sender][index] = true;
    }

    function modifyPost(uint index, string memory newMessage) public {
        require(index < posts.length, "Post does not exist");
        Post storage post = posts[index];
        require(post.author == msg.sender, "You are not the owner of this post");

        post.message = newMessage;
        post.modifiedAt = block.timestamp;
    }
}
