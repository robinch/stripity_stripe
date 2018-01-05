defmodule Stripe.FileUploadTest do
  use Stripe.StripeCase, async: true

  describe "create/2" do
    @tag :skip
    test "creates a file" do
      assert {:ok, %Stripe.FileUpload{}} = Stripe.FileUpload.create(%{
        file: "@/path/to/a/file.jpg",
        purpose: "dispute_evidence"
      })
      assert_stripe_requested :post, "/v1/files"
    end
  end

  describe "retrieve/2" do
    @tag :skip
    test "retrieves an file" do
      assert {:ok, %Stripe.FileUpload{}} = Stripe.FileUpload.retrieve("file_123")
      assert_stripe_requested :get, "/v1/files/file_123"
    end
  end

  describe "list/2" do
    @tag :skip
    test "lists all files" do
      assert {:ok, %Stripe.List{data: [%Stripe.FileUpload{}]}} = Stripe.FileUpload.list()
      assert_stripe_requested :get, "/v1/files"
    end
  end
end