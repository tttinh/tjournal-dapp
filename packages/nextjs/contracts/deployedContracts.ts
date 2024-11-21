/**
 * This file is autogenerated by Scaffold-ETH.
 * You should not edit it manually or your changes might be overwritten.
 */
import { GenericContractsDeclaration } from "~~/utils/scaffold-eth/contract";

const deployedContracts = {
  31337: {
    Journal: {
      address: "0x5FbDB2315678afecb367f032d93F642f64180aa3",
      abi: [
        {
          inputs: [],
          name: "AlreadyRegistered",
          type: "error",
        },
        {
          inputs: [],
          name: "BadStage",
          type: "error",
        },
        {
          anonymous: false,
          inputs: [
            {
              indexed: true,
              internalType: "address",
              name: "owner",
              type: "address",
            },
            {
              indexed: true,
              internalType: "address",
              name: "approved",
              type: "address",
            },
            {
              indexed: true,
              internalType: "uint256",
              name: "tokenId",
              type: "uint256",
            },
          ],
          name: "Approval",
          type: "event",
        },
        {
          anonymous: false,
          inputs: [
            {
              indexed: true,
              internalType: "address",
              name: "owner",
              type: "address",
            },
            {
              indexed: true,
              internalType: "address",
              name: "operator",
              type: "address",
            },
            {
              indexed: false,
              internalType: "bool",
              name: "approved",
              type: "bool",
            },
          ],
          name: "ApprovalForAll",
          type: "event",
        },
        {
          anonymous: false,
          inputs: [
            {
              indexed: true,
              internalType: "address",
              name: "setter",
              type: "address",
            },
            {
              indexed: false,
              internalType: "string",
              name: "newName",
              type: "string",
            },
          ],
          name: "NameUpdated",
          type: "event",
        },
        {
          anonymous: false,
          inputs: [
            {
              indexed: true,
              internalType: "address",
              name: "author",
              type: "address",
            },
            {
              indexed: false,
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
            {
              indexed: false,
              internalType: "string",
              name: "uri",
              type: "string",
            },
          ],
          name: "NewRevision",
          type: "event",
        },
        {
          anonymous: false,
          inputs: [
            {
              indexed: true,
              internalType: "address",
              name: "author",
              type: "address",
            },
            {
              indexed: false,
              internalType: "string",
              name: "uri",
              type: "string",
            },
            {
              indexed: false,
              internalType: "string",
              name: "title",
              type: "string",
            },
            {
              indexed: false,
              internalType: "string",
              name: "description",
              type: "string",
            },
          ],
          name: "NewSubmission",
          type: "event",
        },
        {
          anonymous: false,
          inputs: [
            {
              indexed: true,
              internalType: "address",
              name: "previousOwner",
              type: "address",
            },
            {
              indexed: true,
              internalType: "address",
              name: "newOwner",
              type: "address",
            },
          ],
          name: "OwnershipTransferred",
          type: "event",
        },
        {
          anonymous: false,
          inputs: [
            {
              indexed: true,
              internalType: "uint256",
              name: "id",
              type: "uint256",
            },
            {
              indexed: false,
              internalType: "enum SubmissionStage",
              name: "oldStage",
              type: "uint8",
            },
            {
              indexed: false,
              internalType: "enum SubmissionStage",
              name: "newStage",
              type: "uint8",
            },
          ],
          name: "SubmissionStageChange",
          type: "event",
        },
        {
          anonymous: false,
          inputs: [
            {
              indexed: true,
              internalType: "address",
              name: "from",
              type: "address",
            },
            {
              indexed: true,
              internalType: "address",
              name: "to",
              type: "address",
            },
            {
              indexed: true,
              internalType: "uint256",
              name: "tokenId",
              type: "uint256",
            },
          ],
          name: "Transfer",
          type: "event",
        },
        {
          stateMutability: "nonpayable",
          type: "fallback",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
          ],
          name: "accept",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "editor",
              type: "address",
            },
          ],
          name: "addAreaEditor",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "editor",
              type: "address",
            },
          ],
          name: "addAssociateEditor",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "to",
              type: "address",
            },
            {
              internalType: "uint256",
              name: "tokenId",
              type: "uint256",
            },
          ],
          name: "approve",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
            {
              internalType: "uint256",
              name: "areaEditorId",
              type: "uint256",
            },
          ],
          name: "approveSubmission",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "",
              type: "uint256",
            },
          ],
          name: "areaEditors",
          outputs: [
            {
              internalType: "address",
              name: "",
              type: "address",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
            {
              internalType: "address[]",
              name: "reviewers",
              type: "address[]",
            },
          ],
          name: "assignReviewers",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "",
              type: "uint256",
            },
          ],
          name: "associateEditors",
          outputs: [
            {
              internalType: "address",
              name: "",
              type: "address",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "owner",
              type: "address",
            },
          ],
          name: "balanceOf",
          outputs: [
            {
              internalType: "uint256",
              name: "",
              type: "uint256",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [],
          name: "chiefEditor",
          outputs: [
            {
              internalType: "address",
              name: "",
              type: "address",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
            {
              internalType: "string",
              name: "content",
              type: "string",
            },
          ],
          name: "comment",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "tokenId",
              type: "uint256",
            },
          ],
          name: "getApproved",
          outputs: [
            {
              internalType: "address",
              name: "",
              type: "address",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "user",
              type: "address",
            },
          ],
          name: "getProfile",
          outputs: [
            {
              components: [
                {
                  internalType: "address",
                  name: "id",
                  type: "address",
                },
                {
                  internalType: "string",
                  name: "name",
                  type: "string",
                },
              ],
              internalType: "struct Profile",
              name: "",
              type: "tuple",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "editor",
              type: "address",
            },
          ],
          name: "getSubmissionByAreaEditor",
          outputs: [
            {
              internalType: "uint256[]",
              name: "",
              type: "uint256[]",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "editor",
              type: "address",
            },
          ],
          name: "getSubmissionByAssociateEditor",
          outputs: [
            {
              internalType: "uint256[]",
              name: "",
              type: "uint256[]",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "author",
              type: "address",
            },
          ],
          name: "getSubmissionByAuthor",
          outputs: [
            {
              internalType: "uint256[]",
              name: "",
              type: "uint256[]",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
          ],
          name: "getSubmissionById",
          outputs: [
            {
              components: [
                {
                  internalType: "enum SubmissionStage",
                  name: "stage",
                  type: "uint8",
                },
                {
                  internalType: "uint256",
                  name: "id",
                  type: "uint256",
                },
                {
                  internalType: "string",
                  name: "title",
                  type: "string",
                },
                {
                  internalType: "string",
                  name: "description",
                  type: "string",
                },
                {
                  internalType: "address",
                  name: "author",
                  type: "address",
                },
                {
                  internalType: "uint256[]",
                  name: "revisions",
                  type: "uint256[]",
                },
                {
                  components: [
                    {
                      internalType: "string",
                      name: "content",
                      type: "string",
                    },
                    {
                      internalType: "uint256",
                      name: "createdAt",
                      type: "uint256",
                    },
                    {
                      components: [
                        {
                          internalType: "address",
                          name: "id",
                          type: "address",
                        },
                        {
                          internalType: "string",
                          name: "name",
                          type: "string",
                        },
                      ],
                      internalType: "struct Profile",
                      name: "createdBy",
                      type: "tuple",
                    },
                  ],
                  internalType: "struct Comment[]",
                  name: "comments",
                  type: "tuple[]",
                },
              ],
              internalType: "struct SubmissionResponse",
              name: "",
              type: "tuple",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "owner",
              type: "address",
            },
            {
              internalType: "address",
              name: "operator",
              type: "address",
            },
          ],
          name: "isApprovedForAll",
          outputs: [
            {
              internalType: "bool",
              name: "",
              type: "bool",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "string",
              name: "name",
              type: "string",
            },
          ],
          name: "isAvailable",
          outputs: [
            {
              internalType: "bool",
              name: "",
              type: "bool",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [],
          name: "name",
          outputs: [
            {
              internalType: "string",
              name: "",
              type: "string",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
          ],
          name: "needFurtherReviews",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [],
          name: "owner",
          outputs: [
            {
              internalType: "address",
              name: "",
              type: "address",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "tokenId",
              type: "uint256",
            },
          ],
          name: "ownerOf",
          outputs: [
            {
              internalType: "address",
              name: "",
              type: "address",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
            {
              internalType: "uint256",
              name: "associateEditorId",
              type: "uint256",
            },
          ],
          name: "qualifySubmission",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "string",
              name: "name",
              type: "string",
            },
          ],
          name: "register",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
          ],
          name: "reject",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
          ],
          name: "rejectSubmission",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
          ],
          name: "rejectWhenFiltering",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [],
          name: "renounceOwnership",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
          ],
          name: "revise",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "from",
              type: "address",
            },
            {
              internalType: "address",
              name: "to",
              type: "address",
            },
            {
              internalType: "uint256",
              name: "tokenId",
              type: "uint256",
            },
          ],
          name: "safeTransferFrom",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "from",
              type: "address",
            },
            {
              internalType: "address",
              name: "to",
              type: "address",
            },
            {
              internalType: "uint256",
              name: "tokenId",
              type: "uint256",
            },
            {
              internalType: "bytes",
              name: "data",
              type: "bytes",
            },
          ],
          name: "safeTransferFrom",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "operator",
              type: "address",
            },
            {
              internalType: "bool",
              name: "approved",
              type: "bool",
            },
          ],
          name: "setApprovalForAll",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "eic",
              type: "address",
            },
          ],
          name: "setEIC",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "string",
              name: "newName",
              type: "string",
            },
          ],
          name: "setName",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "string",
              name: "uri",
              type: "string",
            },
            {
              internalType: "string",
              name: "title",
              type: "string",
            },
            {
              internalType: "string",
              name: "description",
              type: "string",
            },
          ],
          name: "submitDocument",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
            {
              internalType: "enum Recommendation",
              name: "rec",
              type: "uint8",
            },
          ],
          name: "submitReview",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "submissionId",
              type: "uint256",
            },
            {
              internalType: "string",
              name: "uri",
              type: "string",
            },
          ],
          name: "submitRevision",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "bytes4",
              name: "interfaceId",
              type: "bytes4",
            },
          ],
          name: "supportsInterface",
          outputs: [
            {
              internalType: "bool",
              name: "",
              type: "bool",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [],
          name: "symbol",
          outputs: [
            {
              internalType: "string",
              name: "",
              type: "string",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "tokenId",
              type: "uint256",
            },
          ],
          name: "tokenURI",
          outputs: [
            {
              internalType: "string",
              name: "",
              type: "string",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "from",
              type: "address",
            },
            {
              internalType: "address",
              name: "to",
              type: "address",
            },
            {
              internalType: "uint256",
              name: "tokenId",
              type: "uint256",
            },
          ],
          name: "transferFrom",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "newOwner",
              type: "address",
            },
          ],
          name: "transferOwnership",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          stateMutability: "payable",
          type: "receive",
        },
      ],
      inheritedFunctions: {
        owner: "@openzeppelin/contracts/access/Ownable.sol",
        renounceOwnership: "@openzeppelin/contracts/access/Ownable.sol",
        transferOwnership: "@openzeppelin/contracts/access/Ownable.sol",
        accept: "contracts/JEditor.sol",
        addAreaEditor: "contracts/JEditor.sol",
        addAssociateEditor: "contracts/JEditor.sol",
        approve: "contracts/JEditor.sol",
        approveSubmission: "contracts/JEditor.sol",
        areaEditors: "contracts/JEditor.sol",
        assignReviewers: "contracts/JEditor.sol",
        associateEditors: "contracts/JEditor.sol",
        balanceOf: "contracts/JEditor.sol",
        chiefEditor: "contracts/JEditor.sol",
        comment: "contracts/JEditor.sol",
        getApproved: "contracts/JEditor.sol",
        getProfile: "contracts/JEditor.sol",
        getSubmissionByAreaEditor: "contracts/JEditor.sol",
        getSubmissionByAssociateEditor: "contracts/JEditor.sol",
        getSubmissionByAuthor: "contracts/JEditor.sol",
        getSubmissionById: "contracts/JEditor.sol",
        isApprovedForAll: "contracts/JEditor.sol",
        isAvailable: "contracts/JEditor.sol",
        name: "contracts/JEditor.sol",
        needFurtherReviews: "contracts/JEditor.sol",
        ownerOf: "contracts/JEditor.sol",
        qualifySubmission: "contracts/JEditor.sol",
        register: "contracts/JEditor.sol",
        reject: "contracts/JEditor.sol",
        rejectSubmission: "contracts/JEditor.sol",
        rejectWhenFiltering: "contracts/JEditor.sol",
        revise: "contracts/JEditor.sol",
        safeTransferFrom: "contracts/JEditor.sol",
        setApprovalForAll: "contracts/JEditor.sol",
        setName: "contracts/JEditor.sol",
        submitDocument: "contracts/JEditor.sol",
        submitReview: "contracts/JEditor.sol",
        submitRevision: "contracts/JEditor.sol",
        supportsInterface: "contracts/JEditor.sol",
        symbol: "contracts/JEditor.sol",
        tokenURI: "contracts/JEditor.sol",
        transferFrom: "contracts/JEditor.sol",
      },
    },
  },
} as const;

export default deployedContracts satisfies GenericContractsDeclaration;
